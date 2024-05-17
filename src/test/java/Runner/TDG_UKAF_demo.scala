package Runner

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef.{constantUsersPerSec, _}

import scala.concurrent.duration._
import scala.language.postfixOps
import io.gatling.core.structure.ScenarioBuilder

class TDG_UKAF_demo extends Simulation{

  before {
    println("Performance tests started")
  }


  var ServiceTest: ScenarioBuilder = scenario("ServiceTest").exec(karateFeature("classpath:Features/TDG_UKAF_Chainning.feature@Perf"))

  setUp(
    ServiceTest.inject(
      //constantConcurrentUsers (1).during(5 minutes))
     constantConcurrentUsers(100).during(1 minutes)),
     // constantUsersPerSec(100).during(1 minute))

    //  incrementConcurrentUsers (5)
    //  .times(3)
     // .eachLevelLasting(60)
     // .separatedByRampsLasting(15)
    //  .startingFrom(5) // Int
   //
  )
  after {
    println("Performance tests ended")
  }
}