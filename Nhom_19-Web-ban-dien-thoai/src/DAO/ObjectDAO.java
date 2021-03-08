package DAO;
import java.sql.SQLException;

public interface ObjectDAO {
     default boolean add(Object obj) throws SQLException, ClassNotFoundException {
                  return false;
    }

    default boolean remove(String id) throws SQLException {
        return false;
    }
    default boolean edit(Object obj) throws SQLException, ClassNotFoundException{
        return false;
    }

}
