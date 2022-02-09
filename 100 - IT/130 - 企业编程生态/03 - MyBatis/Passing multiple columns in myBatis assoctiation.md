## Passing multiple columns in myBatis \<assoctiation>



### 问题

> I want to know, how do we pass multiple columns in a myBatis association tag.
>
> For example, I have the following xml snippet in one my mapper.xml file:
>
> ```java
> <resultMap type="com.mysite.domain.CourseBuilderCourses" id="ResultMapWithAssmnts" extends="BaseResultMap">
> 
>     <association property="totalAssignmentCnt" column="course_id" select="selectTotalAssgnmentsCnt"/>
>     <association property="totalAssessmentCnt" column="course_id" select="selectTotalAssesmentsCnt"/>  
> <!--  see this association >> --> <association property="subscription" column="course_id" select="com.mysite.persistence.mybatis.CourseSubscriptionMapper.selectByUsercId"/> 
> 
>   </resultMap>
> ```
>
> As you can see, the `<association>` with `property` subscription has only one column, `course_id` ^[1]^



### 解决方法

> You should use the following syntax for composite keys:
>
> ```java
> column="{prop1=col1,prop2=col2}".
> ```
>
> Where `prop1, prop2` are parameters of the associated query and `col1, col2` are sql columns passed to that query.
>
> In your case:
>
> **CourseMapper.xml**:
>
> ```java
> column="{courseId=id,userId=user_id}" 
> ...
> select id, user_id, ... from course ...
> ```
>
> **CourseSubscriptionMapper.xml**:
>
> ```java
> <select id="selectByUsercId" ...>
>     select ... where course_id=#{courseId} and user_id=#{userId}
> </select>
> ```
>
> I just checked it worked fine for me. If you have any questions, please feel free to ask. ^[1]^





## 参考

1. [Passing multiple columns in MyBatis \<association> ](https://stackoverflow.com/questions/17193040/passing-multiple-columns-in-mybatis-assoctiation)