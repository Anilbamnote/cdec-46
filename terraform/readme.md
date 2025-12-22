/*
resource "aws_instance" "my_instance" {

}

# <BLOCK_TYPE> <RESOURCE_TYPE> <BLOCK_NAME> {
#     # Configuration
# }
*/




VARIABLES TYPES
--------------------------------
Data types:

string: "Shubham kalsait", "1234235" 

number: 143973249 

bool: true/false, 0/1 

list: ["apple", "banana", "apple", 131643,"mango"] 

tuple: ("apple", "banana", "apple", 131643,"mango") ------immutable ---not change

set: {"apple", "banana", 131643, "mango"} ------------------mutable

map: {fruit = "apple", name = "Anil", address = "ramtek" }




User (India)
   │
   ▼
Nearest Edge Location (e.g., Mumbai)
   │
   ├── Cached Content → Delivered Immediately
   │
   └── If Not Cached → Fetch from Origin (e.g., S3 in us-east-1)
                        │
                        ▼
                  Store copy in Edge Location