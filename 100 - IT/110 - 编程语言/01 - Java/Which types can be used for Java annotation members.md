## Which types can be used for Java annotation members?



> It's specified by [section 9.6.1 of the JLS](https://docs.oracle.com/javase/specs/jls/se8/html/jls-9.html#jls-9.6.1). The annotation member types must be one of:
>
> - primitive
> - String
> - an Enum
> - another Annotation
> - Class
> - an array of any of the above
>
> It does seem restrictive, but no doubt there are reasons for it.
>
> Also note that multidimensional arrays (e.g. `String[][]`) are implicitly forbidden by the above rule.
>
> Arrays of Class are not allowed as described in [this answer](https://stackoverflow.com/a/2067863/2351407). ^[1]^





## 参考

1. [Which types can be used for Java annotation members?](https://stackoverflow.com/questions/1458535/which-types-can-be-used-for-java-annotation-members)