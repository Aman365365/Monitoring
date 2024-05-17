package Utils.Internal;


import net.datafaker.Faker;

import java.util.Locale;


/**
 *
 * @author Akshay
 */
public class RandomDataUtility {


    public static void main(String[] args){

        System.out.println(getRandomNumber(16));
    }

    public static Faker faker = new Faker();


    public static String getRandomNumber(int count) {

        return faker.number().digits(count);
    }


    public static int getRandomNumber(int min, int max) {

        return faker.number().numberBetween(min, max);
    }

    public static String getRandomFirstName() {

        return faker.name().firstName();
    }

    public static String getRandomLastName() {

        return faker.name().lastName();
    }

    public static String getRandomFullName() {
        return faker.name().fullName();
    }

    public static String getRandomUserName() {

        return faker.name().username();
    }

    public static String getRandomCityName() {

        return faker.address().cityName();
    }

    public static String getRandomZipName() {
        return faker.address().zipCode();
    }

    public static String getRandomCountryName() {

        return faker.address().country();
    }

    public static String getRandomEmailName() {
        return faker.name().username() + "@gmail.com";
    }

    public static String getRandomStreetName() {
        return faker.address().streetName();
    }

    public static String getRandomfuladress() {
        return faker.address().fullAddress();
    }

    public static boolean comparestrings(String a , String b) {
        if (a.contains(b)) {
            return true;
        } else {
            return false;
        }


    }
    public static String getrandomfuladressUppercase() {
        return faker.address().fullAddress().toUpperCase(Locale.ROOT);
    }

    public static String getRandomCountryZipCode( String postCode) {
        return faker.address().countyByZipCode( postCode).toUpperCase();
    }

    public static String getRandomCountryZipCode( ) {
        return faker.address().buildingNumber().toUpperCase();
    }
}