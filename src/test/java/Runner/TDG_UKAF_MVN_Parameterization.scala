package Runner

import io.gatling.core.Predef.Simulation
import com.typesafe.config.ConfigFactory
import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef.{constantUsersPerSec, _}

import scala.concurrent.duration._
import scala.language.postfixOps
import io.gatling.core.structure.ScenarioBuilder


class TDG_UKAF_MVN_Parameterization extends Simulation {

  before {
    println("Performance tests started")
  }


  val myramp = java.lang.Long.getLong("ramp")
  val t_concurrency = Integer.getInteger("users", 10)
  val t_rampUp = Integer.getInteger("rampup", 10)
  val t_holdFor = Integer.getInteger("duration", 10)
  val t_throughput = Integer.getInteger("throughput", 10)

  val inject_Concurrent = constantConcurrentUsers(t_concurrency).during(t_holdFor)
  val inject_rampup = rampUsers(t_concurrency).during(t_holdFor)
  val inject_rampersec = constantConcurrentUsers(t_concurrency).during(t_holdFor)
  val inject_Constantuserpersec = nothingFor(t_rampUp)


  val getuser = scenario("getuser").exec(karateFeature("classpath:Features/TDG_UKAF_Chainning.feature@Perf"))




  setUp(
    getuser.inject(inject_rampup))

  after {
    println("Performance tests ended")
  }

}