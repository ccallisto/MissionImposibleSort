with structures; use structures;
generic 
      type node is private;
      MaxItems : Integer := 100;

package DoublyLinkedList is

      type listArr is array(Integer Range <>) of Emp;
      
      procedure Init(list : in out listArr; avail : in out Integer);
      procedure Insert(list : in out listArr; avail:  in out Integer; newItem: in Emp);
      

end DoublyLinkedList;
