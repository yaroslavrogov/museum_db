package org.ors.server.repository;

import org.ors.server.dto.Room;
import org.ors.server.entity.RoomMongo;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomMongoRepository extends MongoRepository<RoomMongo, String>
{
    public RoomMongo findByName(String name);
}
