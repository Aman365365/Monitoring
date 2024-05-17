package Runner

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef.{constantUsersPerSec, _}

import scala.concurrent.duration._
import scala.language.postfixOps
import io.gatling.core.structure.ScenarioBuilder



class TDG_UKAF_Feeder extends Simulation {

  before {
    println("Performance tests started")
  }

  val csvFile =  csv("./Data/DataCsv.csv")

  val FeederToKarate = scenario("FeederToKarate").feed(csv("./Data/DataCsv.csv").circular).exec(karateSet("username", session => session("username").as[String]))
    .exec(karateSet("password", session => session("password").as[String]))
    .exec(karateFeature("classpath:Features/TDG_UKAF_Input_Data_From_Feeder.feature"))


  setUp(
    FeederToKarate.inject(
     // constantUsersPerSec(5).during(5 minutes)

      atOnceUsers(5)
  ))

  after {
    println("Performance tests ended")
  }
}
