package annotation;

//@FirstAnnotation
//@Override
public class Child extends Parent{
    @FirstAnnotation
//    @Override
    public Child(String name) {
        super(name);
    }

    @FirstAnnotation(key = 111)
    @Override
    @Deprecated(since = "3.2",forRemoval = true)
    void print() {
        System.out.println("I'm CHILD");
    }
}
