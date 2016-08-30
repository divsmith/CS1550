# Parker Smith
# CS1550-003
# 4/29/16
# Final Project Stored Procedures

drop procedure if exists AddGroup;

delimiter //
create procedure `AddGroup` (GroupName varchar(20), Favorite varchar(1))
begin

	if GroupName = '' then set GroupName = 'NoGroup'; end if;

    if ( select exists( select 1 from groups where group_name = GroupName))
		then
		update groups set favorite = Favorite where group_name = GroupName;
    else
		insert into groups(group_name, favorite) values(GroupName, Favorite);
    end if;
end //

drop procedure if exists AddRecipe;

delimiter //
create procedure `AddRecipe` (recipeName varchar(20), recipeDesc varchar(100), groupName varchar(20), fav varchar(1))
begin

    if ( select exists( select 1 
    
						from recipes 
                        
                        where recipe_name = recipeName))
	then
		update recipes 
        
			set favorite = Favorite, 
            
				group_id = (select id 
            
							from groups 
                                                
							where group_name = groupName 
                                                
							limit 1), 
                            
				favorite = fav, 
                
                description = recipeDesc
			
		 where recipe_name = recipeName;
    else
		insert into recipes(recipe_name, description, favorite, group_id) 
        
					values(recipeName, recipeDesc, fav, (select id 
																												
														from groups 
                                                                                                                
														where group_name = groupName 
                                                                                                                
														limit 1));
    end if;
end //


drop procedure if exists AddRecipeLine;

delimiter //
create procedure `AddRecipeLine` (RecipeName varchar(20), BaseQuantity int, Measurement varchar(20), Ingredient varchar(20))
begin

		IF (select count(*) from recipe_ingredient ri where ri.ingredient = Ingredient and ri.recipe_id = (select id from recipes r where r.recipe_name = RecipeName)) > 0 THEN
        
				update recipe_ingredient ri
        
				set base_quantity = BaseQuantity, measurement = Measurement
			
				where ri.recipe_id = (select id from recipes r where r.recipe_name = RecipeName)
                        
				and ri.ingredient = Ingredient;
		ELSE
    
			insert into recipe_ingredient(recipe_id, ingredient, measurement, base_quantity)
        
					values((select id from recipes where recipe_name = RecipeName), Ingredient, Measurement, BaseQuantity);
		END IF;

end //


drop procedure if exists GetAllGroupNames;

delimiter //
create procedure `GetAllGroupNames` ()
begin
	select group_name as GroupName, favorite as Favorite from groups;
end //


drop procedure if exists GetAllRecipeNames;

delimiter //
create procedure `GetAllRecipeNames` ()
begin
	select r.recipe_name as RecipeName, r.favorite as Favorite, r.description as RecipeDesc, g.group_name as GroupName
    
    from recipes r
    
		join groups g
        
			on r.group_id = g.id;
end //



drop procedure if exists GetRecipeByName;

delimiter //
create procedure `GetRecipeByName` (RecipeName varchar(20))
begin
	select r.recipe_name as RecipeName, r.description as RecipeDescription, g.group_name as GroupName,ri.base_quantity as BaseQuantity, ri.measurement as Measurement, ri.ingredient as Ingredient
    
    from recipes r
    
		join groups g
        
			on r.group_id = g.id
            
		join recipe_ingredient ri
        
			on ri.recipe_id = r.id
            
	where r.recipe_name = RecipeName;
end //


drop procedure if exists GetRecipesByGroup;

delimiter //
create procedure `GetRecipesByGroup` (GroupName varchar(20))
begin
	select r.recipe_name as RecipeName, r.description as RecipeDescription, g.group_name as GroupName,ri.base_quantity as BaseQuantity, ri.measurement as Measurement, ri.ingredient as Ingredient
    
    from recipes r
    
		join groups g
        
			on r.group_id = g.id
            
		join recipe_ingredient ri
        
			on ri.recipe_id = r.id
            
	where g.group_name = GroupName;
end //


drop procedure if exists DeleteRecipe;

delimiter //
create procedure `DeleteRecipe` (RecipeName varchar(20))
begin
	select id into @var from recipes where recipe_name = RecipeName;
    
    delete from recipe_ingredient where id = @var;
    
    delete from recipes where id = @var;
end //


drop procedure if exists DeleteGroup;

delimiter //
create procedure `DeleteGroup` (GroupName varchar(20))
begin
	select id into @var from groups where group_name = GroupName;
    
    call AddGroup('NoGroup', '0');
    
    update recipes r
    
    set r.group_id = (select id from groups where group_name = 'NoGroup');
    
    delete from groups where group_name = GroupName;
end //



