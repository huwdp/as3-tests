package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import flash.globalization.CurrencyFormatter;
	import flash.globalization.CurrencyParseResult;
	import flash.globalization.LastOperationStatus;
	import flash.globalization.LocaleID;

	public class Main extends Sprite
	{
		public function Main():void
		{
			USTests();
			GBTests();
			currencyFormatterResultTests();
			formattingWithCurrencySymbolIsSafe()
			setCurrencyTests()
			decimalSeparatorTests();
			fractionalDigitsTests();
			leadingZeroTests();
			trailingZerosTests();
			currencyFormatterResultTests();
		}
		
		private function USTests()
		{
			trace("USTests");
			
			// Format
			var cf:CurrencyFormatter = new CurrencyFormatter("en_US");
			var input = 12.50;
			var formattedResult:String = cf.format(input);
			if (formattedResult == "USD12.50")
			{
				trace("Passed");
			}
			else
			{
				trace("Failed, got: " + formattedResult);
			}
			
			// Parse
			var parseResult:CurrencyParseResult = cf.parse("1000");
			if (parseResult.currencyString == "" && parseResult.value == 1000)
			{
				trace("Passed");
			}
			else
			{
				trace("Failed, got: " + parseResult.currencyString + "," + parseResult.value);
			}
		}
		
		private function GBTests()
		{
			trace("GBTests");
			
			var cf:CurrencyFormatter = new CurrencyFormatter("en_GB");
			var input = 12.50;
			var formattedResult:String = cf.format(input);
			
			if (formattedResult == "GBP12.50")
			{
				trace("Passed");
			}
			else
			{
				trace("Failed, got: " + formattedResult);
			}
			
			// Parse
			var parseResult:CurrencyParseResult = cf.parse("1000");
			if (parseResult.currencyString == "" && parseResult.value == 1000)
			{
				trace("Passed");
			}
			else
			{
				trace("Failed, got: " + parseResult.currencyString + "," + parseResult.value);
			}
		}
		
		private function currencyFormatterResultTests()
		{
			trace("currencyFormatterResultTests");
			
			var currencyResult:CurrencyParseResult = new CurrencyParseResult(123, "£");
			if (currencyResult.currencyString == "£" &&  currencyResult.value == 123)
			{
				trace("Passed");
			}
			else
			{
				trace("Failed");
			}
		}
		
		private function formattingWithCurrencySymbolIsSafe()
		{
			trace("formattingWithCurrencySymbolIsSafe");
			
			var cf = new CurrencyFormatter("en_GB");
			if (cf.formattingWithCurrencySymbolIsSafe("GBP"))
			{
				trace("Passed");
			}
			else
			{
				trace("Failed");
			}
			if (!cf.formattingWithCurrencySymbolIsSafe("USD"))
			{
				trace("Passed");
			}
			else
			{
				trace("Failed");
			}
			if (!cf.formattingWithCurrencySymbolIsSafe("EUR"))
			{
				trace("Passed");
			}
			else
			{
				trace("Failed");
			}
		}
		
		private function setCurrencyTests()
		{
			trace("setCurrencyTests");
			
			var cf = new CurrencyFormatter("en_GB");
			var input = 12;
			cf.setCurrency("CAD", "C$")
			if (cf.currencyISOCode == "CAD" && cf.currencySymbol == "C$")
			{
				trace("Passed");
			}
			else
			{
				trace("Failed, got: " + cf.currencyISOCode + ", " + cf.currencySymbol);
			}
		}
		
		private function decimalSeparatorTests()
		{
			trace("decimalSeparatorTests");
			
			// Format
			var cf:CurrencyFormatter = new CurrencyFormatter("en_US");
			cf.decimalSeparator = ":";
			var input = 12;
			var formattedResult = cf.format(input);
			if (formattedResult == "USD12:00")
			{
				trace("Passed");
			}
			else
			{
				trace("Failed, got: " + formattedResult);
			}
			
			// Parse
			var parseResult:CurrencyParseResult = cf.parse("1000");
			if (parseResult.currencyString == "" && parseResult.value == 1000)
			{
				trace("Passed");
			}
			else
			{
				trace("Failed, got: " + parseResult.currencyString + "," + parseResult.value);
			}
		}
		
 	 	private function fractionalDigitsTests()
		{
			trace("fractionalDigitsTests");
			
			// Format
			var cf:CurrencyFormatter = new CurrencyFormatter("en_US");	
			cf.fractionalDigits = 3;
			var input = 12;
			var formattedResult = cf.format(input);
			if (formattedResult == "USD12.000")
			{
				trace("Passed");
			}
			else
			{
				trace("Failed, got: " + formattedResult);
			}
			
			// Parse
			var parseResult:CurrencyParseResult = cf.parse("1000");
			if (parseResult.currencyString == "" && parseResult.value == 1000)
			{
				trace("Passed");
			}
			else
			{
				trace("Failed, got: " + parseResult.currencyString + "," + parseResult.value);
			}
		}
		
 	 	private function lastOperationStatusTests()
		{
			trace("lastOperationStatusTests");
		}
		
 	 	private function leadingZeroTests()
		{
			trace("leadingZeroTests");
			
			// Format
			var cf:CurrencyFormatter = new CurrencyFormatter("en_US");
			cf.leadingZero = 3;
			var input = 12;
			var formattedResult = cf.format(input);
			if (formattedResult == "USD12.00")
			{
				trace("Passed");
			}
			else
			{
				trace("Failed, got: " + formattedResult);
			}
			
			// Parse
			var parseResult:CurrencyParseResult = cf.parse("1000");
			if (parseResult.currencyString == "" && parseResult.value == 1000)
			{
				trace("Passed");
			}
			else
			{
				trace("Failed, got: " + parseResult.currencyString + "," + parseResult.value);
			}
		}
		
 	 	private function negativeSymbolTests()
		{
			trace("negativeSymbolTests");
			
			// Format
			var cf:CurrencyFormatter = new CurrencyFormatter("en_US");
			cf.negativeSymbol = "`";
			var input = 12;
			var formattedResult = cf.format(input);
			if (formattedResult == "")
			{
				trace("Passed");
			}
			else
			{
				trace("Failed, got: " + formattedResult);
			}
			
			// Parse
			var parseResult:CurrencyParseResult = cf.parse("1000");
			if (parseResult.currencyString == "" && parseResult.value == 0)
			{
				trace("Passed");
			}
			else
			{
				trace("Failed, got: " + parseResult.currencyString + "," + parseResult.value);
			}
		}
		
 	 	private function requestedLocaleIDNameTests()
		{
			trace("requestedLocaleIDNameTests");
		}
		
 	 	private function trailingZerosTests()
		{
			trace("trailingZerosTests");
			
			// Format
			var cf:CurrencyFormatter = new CurrencyFormatter("en_US");
			cf.trailingZeros = 4;
			var input = 12;
			var formattedResult = cf.format(input);
			if (formattedResult == "USD12.00")
			{
				trace("Passed");
			}
			else
			{
				trace("Failed, got: " + formattedResult);
			}
			
			// Parse
			var parseResult:CurrencyParseResult = cf.parse("1000");
			if (parseResult.currencyString == "" && parseResult.value == 1000)
			{
				trace("Passed");
			}
			else
			{
				trace("Failed, got: " + parseResult.currencyString + "," + parseResult.value);
			}
		}
	}
}
