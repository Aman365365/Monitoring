package RunnerClasses;



import Utils.External.FeatureSummaryExtractor;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.AfterAll;

import java.io.IOException;
import java.sql.SQLException;



public class SampleRunner {

	@AfterAll
	public static void storedataIntoDatabase() throws SQLException, IOException {
         String[] args = new String[0];
		FeatureSummaryExtractor.main(args);
	}



	@Karate.Test
	Karate Database() {
		return Karate.run("classpath:Features/06_DeleteWorkbook.feature").relativeTo(getClass());
	}

	@Karate.Test
	Karate Excel() {
		return Karate.run("classpath:Features/05_DeleteWorksheet.feature").relativeTo(getClass());
	}
	@Karate.Test
	Karate Json() {
		return Karate.run("classpath:Features/04_UpdateWorksheet.feature").relativeTo(getClass());
	}
	@Karate.Test
	Karate Feeder() {
		return Karate.run("classpath:Features/03_UpdateWorkbook.feature").relativeTo(getClass());
	}

	@Karate.Test
	Karate Csv() {
		return Karate.run("classpath:Features/01_Homepage.feature").relativeTo(getClass());
	}

	@Karate.Test
	Karate Chaining () {
			return Karate.run("classpath:Features/").relativeTo(getClass());
		}

	}

