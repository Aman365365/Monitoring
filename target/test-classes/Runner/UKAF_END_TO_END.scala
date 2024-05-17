

package Runner

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef.{Simulation, exec, _}

import scala.concurrent.duration._
import scala.language.postfixOps
import io.gatling.core.structure.ScenarioBuilder
import org.apache.poi.ss.usermodel.{DataFormatter, WorkbookFactory}
import io.gatling.core.feeder.Random

import scala.concurrent.duration.Duration.Inf


class UKAF_END_TO_END extends Simulation {
    val protocol = karateProtocol()
    var HomePage = scenario("01_HomePage").group("01_HomePage") {
    exec(karateFeature("classpath:Features/01_Homepage.feature"))
  }

  val InsertWorkbook = scenario("02_InsertWorkbook").group("02_InsertWorkbook") {
    exec(karateFeature("classpath:Features/02_InsertWorkBook.feature"))
  }

  var UpdateWorkbook = scenario("03_UpdateWorkbook").group("03_UpdateWorkbook") {
    exec(karateFeature("classpath:Features/03_UpdateWorkbook.feature"))
  }

  var UpdateSheet = scenario("04_UpdateSheet").group("04_UpdateSheet") {
    exec(karateFeature("classpath:Features/04_UpdateWorksheet.feature"))
  }

  var DeleteSheet = scenario("05_DeleteSheet").group("05_DeleteSheet") {
    exec(karateFeature("classpath:Features/05_DeleteWorksheet.feature"))
  }

  var DeleteWorkbook = scenario("06_DeleteWorkbook").group("06_DeleteWorkbook") {
    exec(karateFeature("classpath:Features/06_DeleteWorkbook.feature"))
  }



  val UKAF_EndToEnd = scenario("UKAF_EndToEnd").group("UKAF_EndToEnd")(
      exec(
        HomePage
      )
        .exitHereIfFailed
        .pause(2)
        .exec(
          InsertWorkbook
        )
        .exitHereIfFailed
        .pause(2)

        exec (
        UpdateWorkbook
        )
        .exitHereIfFailed
        .pause(2)
        exec (
        UpdateSheet
        )
        .exitHereIfFailed
        .pause(2)
        exec (
        DeleteSheet
        )
        .exitHereIfFailed
        .pause(2)
        exec (
        DeleteWorkbook
        )
        .exitHereIfFailed
        .pause(2)
    )


  val rampup = constantConcurrentUsers(10).during(15 minutes)



  setUp(
    UKAF_EndToEnd.inject(rampup).protocols(protocol))
}