create view myview as select 0 as id;
create table mytable(id int);


create trigger mytrigger instead of insert on myview
begin
    insert into mytable (id) values (1);
end;
