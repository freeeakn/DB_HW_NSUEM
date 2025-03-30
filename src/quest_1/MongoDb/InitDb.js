import { MongoClient } from "mongodb";

async function initDB() {
  const uri = "mongodb://localhost:27017"; // Укажите ваш URI
  const client = new MongoClient(uri);

  try {
    await client.connect();
    const db = client.db("school");
    db = db.getSiblingDB("school");

    db.addresses.drop();
    db.createCollection("addresses");
    db.addresses.insertMany([
      { city: "New York", street: "Broadway", house_number: "123" },
      { city: "Los Angeles", street: "Sunset Blvd", house_number: "456" },
    ]);

    db.directions.drop();
    db.createCollection("directions");
    db.directions.insertMany([
      { name: "Computer Science" },
      { name: "Mathematics" },
    ]);
    db.directions.createIndex({ name: 1 }, { unique: true });

    db.fundingTypes.drop();
    db.createCollection("fundingTypes");
    db.fundingTypes.insertMany([
      { name: "Scholarship" },
      { name: "Self-funded" },
    ]);
    db.fundingTypes.createIndex({ name: 1 }, { unique: true });

    db.groups.drop();
    db.createCollection("groups");
    const directionCS = db.directions.findOne({ name: "Computer Science" });
    const directionMath = db.directions.findOne({ name: "Mathematics" });
    db.groups.insertMany([
      { name: "Group A", direction_id: directionCS._id },
      { name: "Group B", direction_id: directionMath._id },
    ]);

    db.students.drop();
    db.createCollection("students");
    const address1 = db.addresses.findOne({ house_number: "123" });
    const address2 = db.addresses.findOne({ house_number: "456" });
    const groupA = db.groups.findOne({ name: "Group A" });
    const fundingScholarship = db.fundingTypes.findOne({ name: "Scholarship" });
    db.students.insertMany([
      {
        first_name: "John",
        surname: "Doe",
        last_name: "Smith",
        birth_date: new Date("2000-01-01"),
        address_id: address1._id,
        group_id: groupA._id,
        email: "john.doe@example.com",
        funding_type_id: fundingScholarship._id,
      },
    ]);
    db.students.createIndex({ email: 1 }, { unique: true });

    db.phone_numbers.drop();
    db.createCollection("phone_numbers");
    const studentJohn = db.students.findOne({ email: "john.doe@example.com" });
    db.phone_numbers.insertMany([
      { student_id: studentJohn._id, phone_number: "+1234567890" },
    ]);
    console.log("Database initialized successfully!");
  } catch (error) {
    console.error("Error initializing database:", error);
  } finally {
    await client.close();
  }
}

initDB();
