## Difference between putting a property on application.yml or bootstrap.yml



### application.yml

> *application.yml/application.properties* file is specific to Spring Boot applications. Unless you change the location of external properties of an application, 



### bootstrap.yml

> - bootstrap.yml is used when you are using Spring Cloud and your application's configuration is stored on a remote configuration server (e.g. Spring Cloud Config Server). bootstrap.yml is loaded before application.yml
>
> - Another use for **bootstrap.yml** is to load configuration from kubernetes **configmap** and **secret** resources. 
>
>   The application must import the **spring-cloud-starter-kubernetes** dependency.
>
>   As with the Spring Cloud Config, this has to take place during the bootstrap phrase.
>
>   From the docs :
>
>   ```java
>   spring:
>       application:
>         name: cloud-k8s-app
>       cloud:
>         kubernetes:
>           config:
>             name: default-name
>             namespace: default-namespace
>             sources:
>              # Spring Cloud Kubernetes looks up a ConfigMap named c1 in namespace default-namespace
>              - name: c1
>   ```
>
>   So properties stored in the configmap resource with meta.name default-name can be referenced just the same as properties in **application.yml**
>   
> - `bootstrap.yml` is used to save parameters that point out where the remote configuration is and **Bootstrap Application Context** is created with these remote configuration.
>
> - If you do place properties in `bootstrap.yml`, they will get ==lower precedence== than almost any other property sources, including application.yml. As described [here](https://cloud.spring.io/spring-cloud-static/spring-cloud-commons/2.1.1.RELEASE/single/spring-cloud-commons.html#_application_context_hierarchies).



## 参考

1. [What is the difference between putting a property on application.yml or bootstrap.yml in spring boot?](https://stackoverflow.com/questions/32997352/what-is-the-difference-between-putting-a-property-on-application-yml-or-bootstra)
