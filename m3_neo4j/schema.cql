/*
 * NEO4J
 * As Neo4j is "pure" NoSQL, there's no way to define schema
 * This file is only used as a TEMPLATE for model of database
 */

//creating tables
CREATE (N:VISITOR {MONGOID:mongoid_v}) RETURN N;
CREATE (N:EXCURSION {DATE:date,LANGUAGE:lang,GUIDE:guide,MAX_PEOPLE:max_people}) RETURN N;
CREATE (N:AUTHOR {MONGOID:mongoid_a}) RETURN N;
CREATE (N:CATHEGORY {NAME:cat_name}) RETURN N;
CREATE (N:HALL {MONGOID:mongoid_h}) RETURN N;
CREATE (N:EXHIBIT {MONGOID:mongoid_e}) RETURN N;

//creating relationships
//P_INTERESTED = POTENTIALLY INTERESTED
MATCH (A:VISITOR {MONGOID:mongoid_v}),(B:AUTHOR {MONGOID:mongoid_a}) MERGE (A)-[r:VISITED]->(B);
MATCH (A:VISITOR {MONGOID:mongoid_v}),(B:CATHEGORY {NAME:cat_name}) MERGE (A)-[r:VISITED]->(B);
MATCH (A:VISITOR {MONGOID:mongoid_v}),(B:AUTHOR {MONGOID:mongoid_a}) MERGE (A)-[r:P_INTERESTED]->(B);
MATCH (A:VISITOR {MONGOID:mongoid_v}),(B:CATHEGORY {NAME:cat_name}) MERGE (A)-[r:P_INTERESTED]->(B);

//excursion "linked list"
MATCH (A:EXCURSION {DATE:date}), (B:HALL {MONGOID:mongoid_h} )) MERGE (A)-[r:PATH_START]->(B);
MATCH (A:HALL {MONGOID:mongoid_h}), (B:HALL {MONGOID:mongoid_h1} )) MERGE (A)-[r:PATH_POINT]->(B);
MATCH (A:HALL {MONGOID:mongoid_h1}), (B:HALL {MONGOID:mongoid_h2} )) MERGE (A)-[r:PATH_END]->(B);

MATCH (A:EXCURSION {DATE:date}), (B:CATHEGORY {NAME:cat_name}) MERGE (A)-[r:CATHEGORIZED]->(B);

//authors
MATCH (A:AUTHOR {MONGOID:mongoid_a}),(B:AUTHOR {MONGOID:mongoid_a1}) MERGE (A)-[r:CONTEMPORARY]->(B);
MATCH (A:AUTHOR {MONGOID:mongoid_a}),(B:AUTHOR {MONGOID:mongoid_a1}) MERGE (A)<-[r:CONTEMPORARY]-(B);

MATCH (A:AUTHOR {MONGOID:mongoid_a}),(B:CATHEGORY {NAME:cat_name}) MERGE (A)-[r:SPHERE]->(B);

MATCH (A:AUTHOR {MONGOID:mongoid_a}),(B:EXHIBIT {MONGOID:mongoid_e}) MERGE (A)-[r:CREATED]->(B);

//exhibits
MATCH (A:EXHIBIT {MONGOID:mongoid_e}),(B:CATHEGORY {NAME:cat_name}) MERGE (A)-[r:CATHEGORIZED]->(B);
MATCH (A:EXHIBIT {MONGOID:mongoid_e}),(B:CATHEGORY {NAME:cat_name}) MERGE (A)<-[r:CATHEGORIZED]-(B);

MATCH (A:EXHIBIT {MONGOID:mongoid_e}),(B:HALL {MONGOID:mongoid_h}) MERGE (A)-[r:IS_IN]->(B);
MATCH (A:EXHIBIT {MONGOID:mongoid_e}),(B:HALL {MONGOID:mongoid_h}) MERGE (A)<-[r:CONTAINS]-(B);


//CLEAR ALL SHIT
// MATCH (N) DETACH DELETE N

// Example:
// CREATE (A:VISITOR {MONGOID:1})
// CREATE (B:EXHIBIT {MONGOID:1})
// CREATE (C:HALL {MONGOID:1})
// CREATE (D:HALL {MONGOID:2})
// CREATE (E:HALL {MONGOID:3})
// CREATE (F:AUTHOR {MONGOID:1})
// CREATE (H:AUTHOR {MONGOID:2})
// CREATE (I:CATHEGORY {NAME:"Default"})
// CREATE (G:EXCURSION {DATE:"Sat Apr 14 17:02:52 MSK 2018",LANGUAGE:"Ru",GUIDE:"Jojo",MAX_PEOPLE:9000})
// MATCH (A:VISITOR {MONGOID:1}),(B:AUTHOR {MONGOID:1}) MERGE (A)-[r:VISITED]->(B)
// MATCH (A:VISITOR {MONGOID:1}),(B:AUTHOR {MONGOID:1}) MERGE (A)-[r:P_INTERESTED]->(B)
// MATCH (A:VISITOR {MONGOID:1}),(B:CATHEGORY {NAME:"Default"}) MERGE (A)-[r:VISITED]->(B)
// MATCH (A:VISITOR {MONGOID:1}),(B:CATHEGORY {NAME:"Default"}) MERGE (A)-[r:P_INTERESTED]->(B)
// MATCH (A:EXCURSION {DATE:"Sat Apr 14 17:02:52 MSK 2018"}), (B:HALL {MONGOID:1}) MERGE (A)-[r:PATH_START]->(B)
// MATCH (A:HALL {MONGOID:1}), (B:HALL {MONGOID:2}) MERGE (A)-[r:PATH_POINT]->(B)
// MATCH (A:HALL {MONGOID:2}), (B:HALL {MONGOID:3}) MERGE (A)-[r:PATH_END]->(B)
// MATCH (A:EXCURSION {DATE:"Sat Apr 14 17:02:52 MSK 2018"}), (B:CATHEGORY {NAME:"Default"}) MERGE (A)-[r:CATHEGORIZED]->(B)
// MATCH (A:AUTHOR {MONGOID:1}),(B:AUTHOR {MONGOID:2}) MERGE (A)-[r:CONTEMPORARY]->(B)
// MATCH (A:AUTHOR {MONGOID:1}),(B:AUTHOR {MONGOID:2}) MERGE (A)<-[r:CONTEMPORARY]-(B)
// MATCH (A:AUTHOR {MONGOID:1}),(B:CATHEGORY {NAME:"Default"}) MERGE (A)-[r:SPHERE]->(B)
// MATCH (A:AUTHOR {MONGOID:1}),(B:EXHIBIT {MONGOID:1}) MERGE (A)-[r:CREATED]->(B)
// MATCH (A:EXHIBIT {MONGOID:1}),(B:CATHEGORY {NAME:"Default"}) MERGE (A)-[r:CATHEGORIZED]->(B)
// MATCH (A:EXHIBIT {MONGOID:1}),(B:CATHEGORY {NAME:"Default"}) MERGE (A)<-[r:CATHEGORIZED]-(B)
// MATCH (A:EXHIBIT {MONGOID:1}),(B:HALL {MONGOID:1}) MERGE (A)-[r:IS_IN]->(B)
// MATCH (A:EXHIBIT {MONGOID:1}),(B:HALL {MONGOID:1}) MERGE (A)<-[r:CONTAINS]-(B)