//use museum;

db.createCollection("exhibit", {
   validator: {
      $jsonSchema: {
         bsonType: "object",
         required: [ "name", "creation_date", "materials" ],
         properties: {
            name: {
               bsonType: "string",
               description: "must be a string and is required"
            },
            creation_date: {
               description: "must be a date and is required"
            },
            materials: {
               bsonType: "string",
               description: "must be a string and is required"
            }
          }
        }
    }
});
db.createCollection("visiter", {
   validator: {
      $jsonSchema: {
         bsonType: "object",
         required: [ "name", "type" ],
         properties: {
            name: {
               bsonType: "string",
               description: "must be a string and is required"
            },
            type: {
               enum: [ "student", "senior", "casual", "priveleged" ],
               description: "can only be one of the enum values and is required"
            },
          }
        }
    }
});
db.createCollection("author", {
   validator: {
      $jsonSchema: {
         bsonType: "object",
         required: [ "name", "birth_date", "death_date", "country" ],
         properties: {
            name: {
               bsonType: "string",
               description: "must be a string and is required"
            },
            birth_date: {
               description: "must be a date and is required"
            },
            death_date: {
               description: "must be a date and is not required"
            },
            country: {
               bsonType: "string",
               description: "must be a string and is required"
            }
          }
        }
    }
});
db.createCollection("hall", {
   validator: {
      $jsonSchema: {
         bsonType: "object",
         required: [ "name", "schedule" ],
         properties: {
            name: {
               bsonType: "string",
               description: "must be a string and is required"
            },
            schedule: {
               bsonType: "string",
               description: "must be a string and is required"
            }
          }
        }
    }
});
