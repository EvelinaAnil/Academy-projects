package annotation;

@SecondAnnotation(color = SecondAnnotation.Color.RED)
public class Parent {
    @SecondAnnotation(color = SecondAnnotation.Color.GREEN)
    @Third(value = {"one", "two"}, first = @FirstAnnotation(key = 666))
    private String name;

    @SecondAnnotation
    @Third(value = {"one", "two","three"})
    public Parent(@SecondAnnotation String name) {
        this.name = name;
    }

    @SecondAnnotation
    @Third({"one"})
    public String getName() {
        @SecondAnnotation
        int value = 1;
        return name;
    }

    @SecondAnnotation
    @Third("one")
    public void setName(@SecondAnnotation String name) {
        this.name = name;
    }
    @Third({"one","two","three"})
    void print(){
        System.out.println("I'm PARENT!");
    }
}
