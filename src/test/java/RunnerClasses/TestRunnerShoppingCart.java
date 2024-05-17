package RunnerClasses;
import com.intuit.karate.junit5.Karate;

public class TestRunnerShoppingCart
{


    @Karate.Test
    Karate AddToCart() {
        return Karate.run("classpath:UIAutomation/AddToCart.feature").relativeTo(getClass());
    }

}
