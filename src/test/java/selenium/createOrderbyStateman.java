import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
//import org.aspectj.weaver.ast.Test;
import org.junit.*;
import static org.junit.Assert.*;
import junit.framework.TestCase;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;
import java.lang.annotation.Annotation;

public class createOrderbyStateman extends TestCase {
  private WebDriver driver;
  private String baseUrl;
  private boolean acceptNextAlert = true;
  private StringBuffer verificationErrors = new StringBuffer();

  @Before
  public void setUp() throws Exception {
    driver = new FirefoxDriver();
    baseUrl = "http://localhost:8085";
    driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
  }

  @Test
  public void testCreateOrderCreationPassed() throws Exception {
    driver.get(baseUrl + "/ClassicWebApplication/index");
    driver.findElement(By.cssSelector("u")).click();
    driver.findElement(By.id("name")).clear();
    driver.findElement(By.id("name")).sendKeys("user@user.com");
    driver.findElement(By.id("password")).clear();
    driver.findElement(By.id("password")).sendKeys("121");
    driver.findElement(By.xpath("//button[@type='submit']")).click();
    driver.findElement(By.xpath("//div[@id='slider1_container']/div/div/div[4]/div/div/div[2]/div[6]/div[2]/div[2]")).click();
    driver.findElement(By.linkText("Сделать заказ прямо сейчас!")).click();
    driver.findElement(By.id("description")).clear();
    driver.findElement(By.id("description")).sendKeys("89991613678");
    driver.findElement(By.xpath("(//label[@id='fashion'])[4]")).click();
    driver.findElement(By.xpath("//form[@id='order']/div[3]/div/span/div/button")).click();
    driver.findElement(By.linkText("XL (50)")).click();
    driver.findElement(By.id("in-place-date")).click();
    driver.findElement(By.id("in-place-date")).clear();
    driver.findElement(By.id("in-place-date")).sendKeys("06/29/2014");
    driver.findElement(By.xpath("(//label[@id='recipe'])[4]")).click();
    driver.findElement(By.xpath("//button[@type='submit']")).click();
    assertEquals("Платьице", driver.findElement(By.xpath("//table[@id='datatable-table']/tbody/tr/td[3]")).getText());
    assertEquals("Отправлен", driver.findElement(By.cssSelector("span.label.label-default")).getText());
  }

  @After
  public void tearDown() throws Exception {
    driver.findElement(By.cssSelector("u")).click();
    driver.quit();
    String verificationErrorString = verificationErrors.toString();
    if (!"".equals(verificationErrorString)) {
      fail(verificationErrorString);
    }
  }

  private boolean isElementPresent(By by) {
    try {
      driver.findElement(by);
      return true;
    } catch (NoSuchElementException e) {
      return false;
    }
  }

  private boolean isAlertPresent() {
    try {
      driver.switchTo().alert();
      return true;
    } catch (NoAlertPresentException e) {
      return false;
    }
  }

  private String closeAlertAndGetItsText() {
    try {
      Alert alert = driver.switchTo().alert();
      String alertText = alert.getText();
      if (acceptNextAlert) {
        alert.accept();
      } else {
        alert.dismiss();
      }
      return alertText;
    } finally {
      acceptNextAlert = true;
    }
  }
}
