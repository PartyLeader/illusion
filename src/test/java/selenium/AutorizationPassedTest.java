package selenium;

import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;

//import org.aspectj.weaver.ast.*;
import org.junit.*;
import static org.junit.Assert.*;
import junit.framework.TestCase;
import static org.hamcrest.CoreMatchers.*;

import org.junit.Test;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;
import java.lang.annotation.Annotation;

public class AutorizationPassedTest extends TestCase{
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
  public void testAutorizationPassed() throws Exception {
    driver.get(baseUrl + "/ClassicWebApplication/index");
    driver.findElement(By.cssSelector("u")).click();
    driver.findElement(By.id("email")).clear();
    driver.findElement(By.id("email")).sendKeys("user@user.com");
    driver.findElement(By.id("password")).clear();
    driver.findElement(By.id("password")).sendKeys("121");
    driver.findElement(By.xpath("//button[@type='submit']")).click();
    assertEquals("user@user.com/ Выйти", driver.findElement(By.id("user-menu")).getText());
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
