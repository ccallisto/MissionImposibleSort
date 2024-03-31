with structures; use structures;
with Ada.Text_IO; use Ada.Text_IO;
package body DoublyLinkedList is

   procedure Init(list : in out listArr; avail : in out Integer) is
   begin
      avail := 1;
      for J in JobType loop
         list(avail).Job := J; 
         list(avail).Next := 0; 
         list(avail).Prev := 0; 
         avail := avail + 1; 
      end loop;
   end Init;

   procedure Insert(list : in out listArr; avail: in out Integer; newItem: in Emp) is
      current, previous, head : Integer := 0;
   begin
      if avail <= list'Length then
         list(avail) := newItem;

         head := JobType'Pos(newItem.Job) + 1;
         
         current := list(head).Next;
         
while current /= 0 loop
    if list(current).Age < newItem.Age then
        previous := current;
        current := list(current).Next;
    elsif list(current).Age = newItem.Age and then list(current).Name < newItem.Name then
       
        previous := current;
        current := list(current).Next;
    else
        exit;
    end if;
end loop;

         if previous = 0 then 
            list(avail).Next := list(head).Next;
            list(avail).Prev := head;
            if list(head).Next /= 0 then
               list(list(head).Next).Prev := avail;
            end if;
            list(head).Next := avail;
         else
            list(avail).Next := list(previous).Next;
            list(avail).Prev := previous;
            list(previous).Next := avail;
            if list(avail).Next /= 0 then
               list(list(avail).Next).Prev := avail;
            end if;
         end if;
         
         avail := avail + 1;
      else
         Put_Line("Error: List is full.");
      end if;
   end Insert;
   
end DoublyLinkedList;
