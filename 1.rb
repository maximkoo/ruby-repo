rails generate model street name:string
rails generate model house num:integer num_extra:string street:references

rails generate controller streets
rails generate controller houses

rails generate model person name:string birthdate:date credit:integer comments:text
rails genet