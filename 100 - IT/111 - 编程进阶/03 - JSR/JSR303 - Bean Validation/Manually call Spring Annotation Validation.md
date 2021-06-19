## Manually call Spring Annotation Validation



```java
@Autowired
private javax.validation.Validator validator;


Set<ConstraintViolation<Driver>> violations = validator.validate(driver);
```





## 参考
1. [Manually call Spring Annotation Validation](https://stackoverflow.com/questions/19190592/manually-call-spring-annotation-validation)

