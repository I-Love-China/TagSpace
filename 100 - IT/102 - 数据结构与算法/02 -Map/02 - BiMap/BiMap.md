## BiMap

### 适用场景 / What

Bi-directional Map



### 已有实现 & 代码示例

1. [**Guava -- BiMap ^[1]^**](https://github.com/google/guava)

   ```java
   import com.google.common.collect.BiMap;
   import com.google.common.collect.HashBiMap;
   
   public class BiMapTest {
   
     public static void main(String[] args) {
   
       BiMap<String, String> biMap = HashBiMap.create();
   
       biMap.put("k1", "v1");
       biMap.put("k2", "v2");
   
       System.out.println("k1 = " + biMap.get("k1"));
       System.out.println("v2 = " + biMap.inverse().get("v2"));
     }
   }
   ```

2. [**commons-collections -- BiDiMap ^[2]^**](https://github.com/apache/commons-collections)

   ```java
   BidiMap<String, String> map = new DualHashBidiMap<>();
   map.put("key1", "value1");
   map.put("key2", "value2");
   assertEquals(map.size(), 2);
   
   BidiMap<String, String> rMap = map.inverseBidiMap();
   assertTrue(rMap.containsKey("value1") && rMap.containsKey("value2"));
   ```

   

### com.google.common.collect.HashBiMap 实现

#### 存储结构

```java
  private transient BiEntry<K, V>[] hashTableKToV;
  private transient BiEntry<K, V>[] hashTableVToK;
```







## 参考

1. [Bi-directional Map in Java?](https://stackoverflow.com/questions/10699492/bi-directional-map-in-java)

2. [Apache Commons Collections BidiMap](https://www.baeldung.com/commons-collections-bidi-map)