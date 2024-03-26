public class assign1 {

    public static int binaryStringToInt(String binaryString)
    {
        int decimal = 0;
        int power = 15;

        for (int i = 0; i < binaryString.length(); i++)
        {
            char bit = binaryString.charAt(i);
            
            if (bit == '1')
            {
                decimal += Math.pow(2, power);
            }

            power--;
        }

        return decimal;
    }

    public static long hexStringToInt(String hexString)
    {
        long result = 0;

        for (int i = hexString.length() - 1; i >= 0; i--) {
            
            char hexChar = hexString.charAt(i);
            int hexDigit;
    
            if (hexChar >= '0' && hexChar <= '9') {
                hexDigit = hexChar - '0';
            } 
            else if (hexChar >= 'A' && hexChar <= 'F') 
            {
                hexDigit = hexChar - 'A' + 10;
            } 
            else if (hexChar >= 'a' && hexChar <= 'f') 
            {
                hexDigit = hexChar - 'a' + 10;
            } 
            else 
            {
                throw new IllegalArgumentException("Invalid Input");
            }
    
            result += hexDigit * (long) Math.pow(16, hexString.length() - 1 - i);
        }
    
        return result;
    }
    

    public static void main(String[] args)
    {
        //Problem Set 1
        System.out.println(binaryStringToInt("1010101010101010")); //Small
        System.out.println(binaryStringToInt("1100110011001100")); //Middle
        System.out.println(binaryStringToInt("1111111111111111")); //Full

        //Problem Set 2
        System.out.println(hexStringToInt("1F")); //Small 
        System.out.println(hexStringToInt("7FFF")); //Middle
        System.out.println(hexStringToInt("FFFFFFFF")); //Full
    }

}