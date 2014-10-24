/***
 * Excerpted from "Stripes: and Java Web Development is Fun Again",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
***/
package es.unileon.dao.mock;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import es.unileon.dao.Dao;
import es.unileon.model.ModelBase;

/**
 * Mock abstract implementation of the DAO. This implementation
 * does not attempt to be efficient; rather, it serves the purposes of
 * providing a simple working DAO with no dependencies on libraries or
 * a database.
 */
public abstract class MockDao<T extends ModelBase>
    implements Dao<T>
{
    private List<T> list = new ArrayList<T>();
    private Map<Integer,T> map = new HashMap<Integer,T>();
    private int nextId = 1;

    public void save(T object) {
        if (object != null) {
            if (object.getId() == null) {
                int id = nextId++;
                object.setId(id);
                list.add(object);
            }
            else {
                Integer id = object.getId();
                list.set(list.indexOf(map.get(id)), object);
            }
            map.put(object.getId(), object);
        }
    }

    public List<T> read() {
        List<T> objects = new ArrayList<T>(list.size());
        for (T object : list) {
            T copy = copyObject(object);
            if (copy != null) {
                objects.add(copy);
            }
            else {
                objects.add(object);
            }
        }
        return objects;
    }

    public T read(Integer id) {
        T original = map.get(id);
        T copy = copyObject(original);
        return copy != null ? copy : original;
    }

    public void delete(Integer id) {
        T object = map.get(id);
        list.remove(object);
        map.remove(id);
    }

    protected T copyObject(T object) {
        return null;
    }
}
