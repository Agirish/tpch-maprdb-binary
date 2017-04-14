import java.text.DecimalFormat;

/**
 * 
 */

/**
 * @author kkhatua
 *
 */
public class LexicalNumberGenerator {
	private static final int INVALID = -1;
	private boolean dBug;
	private int idx = 0;
	private int digitArr[];
	private int maxWidth;
	private long limit;
	private long nextValue;
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		//args[0] = "150000000";
		//args[1] = "1";
		long rangeMax = Long.parseLong(args[0]);
		LexicalNumberGenerator splitGen = new LexicalNumberGenerator(rangeMax, Long.parseLong(args[1]));
//		splitGen.setRangeUpperLimit(Long.parseLong(args[0]));
//		splitGen.setStart(Long.parseLong(args[1]));

		int splits = Integer.parseInt(System.getProperty("splits", "1"));
		long splitInterval = rangeMax/splits;
		long startTime = System.currentTimeMillis();
		//If NOT-split Gen
		if (splits == 1) {
			//Sequence Generator
			long sequenceKey;
			for (long i = 0; i < rangeMax; i++) {
				sequenceKey = splitGen.next();
				if (sequenceKey < 0) break; //End of Sequence
				System.out.println(sequenceKey);
			}
		} else {
			//SplitKey Gen
			long sequenceKey;
			int splitsDone = 1; 
			for (long i = 1; i <= rangeMax && splitsDone < splits; i++) {
				sequenceKey = splitGen.next();
				if (sequenceKey < 0) break; //End of Sequence
				if (i%splitInterval == 0) {
					System.out.println(sequenceKey);
					splitsDone++;
				}
			}
		}
		long duration = System.currentTimeMillis()-startTime;
		DecimalFormat formatter = new DecimalFormat("#,###.##");
		if (duration > 0)
			System.err.println(duration+ " msec ("+formatter.format(rangeMax*1000/duration)+" rows/sec)");

	}

	private long next() {
		boolean hasNext = false;
		while (!hasNext) {
			//Generate from GrowthPhase
			hasNext = growthPhase();
			if (hasNext) return nextValue;
			
			//Generate from IncrementPhase
			if (limit >= getValue(digitArr,idx)) {
				hasNext = incrementPhase();
				if (hasNext) return nextValue;
			}

			do {
				if (dBug) System.out.println("**Dropping a digit**");
				idx--;
				if (dBug) System.out.println("**Init last digit with an increment**");
				if (idx < 0) return INVALID; //Reached end of sequence (e.g. 999 .. max 1000)
				digitArr[idx]++;
			} while (digitArr[idx] == 10); 			

		}
		
		return INVALID;
	}

	public LexicalNumberGenerator(long rangeMax, long startAt) {
		setRangeUpperLimit(rangeMax);
		setStart(startAt);
	}

	private boolean growthPhase() {
		long currValue = -1L;
		boolean status = false;

		if (idx < maxWidth) {
			currValue = getValue(digitArr,idx);
			if (nextValue != currValue)
				if (currValue <= limit) {
					nextValue = currValue;
					status = true;
				}
			idx++;	
			
			if (idx < maxWidth) 
				digitArr[idx]=0; //Appending 0 
			else 		//(idx == maxWidth) Resetting to stay within array limits
				idx--;	
		}

		//Returning status
		return status;
	}
	
	private boolean incrementPhase() {
		if (dBug) System.out.println("**Incrementing last digit**" + idx);
		long currValue;
		boolean status = false;
		if ( digitArr[idx] < 9 ) {
			digitArr[idx]++;
			currValue = getValue(digitArr,idx);
			if (currValue <= limit) {
				nextValue = currValue;
				status = true;
			}
		}		
		return status;
	}
	
	private long getValue(int[] digits, int lastIdx) {
		long value = digits[0];
		for (int i = 1; i <= lastIdx; i++) {
			value = value*10 + digits[i];			
		}
		return value;		
	}

	private void setRangeUpperLimit(long rangeUpperLimit) {
		limit = rangeUpperLimit;
		if (maxWidth == 0) {
			maxWidth = String.valueOf(limit).length();
			digitArr = new int[maxWidth];
			for (int i = 0; i < digitArr.length; i++) 
				digitArr[i] = INVALID;
		} else {
			int oldMaxWidth = maxWidth;
			maxWidth = String.valueOf(limit).length();
			int newDigitArr[] = new int[maxWidth];
			for (int i = 0; i < oldMaxWidth; i++)
				newDigitArr[i] = digitArr[i];
			for (int i = oldMaxWidth; i< maxWidth ; i++)						
				digitArr[i] = INVALID;			
		}
	}

	private void setStart(long startValue) {
		String startAsStr = String.valueOf(startValue);
		if (maxWidth == 0) {
			maxWidth = String.valueOf(startAsStr).length();
			digitArr = new int[maxWidth];
			for (int i = 0; i < digitArr.length; i++) 
				digitArr[i] = INVALID;
		}
		for (int i = 0; i < startAsStr.length(); i++) 
			digitArr[i] = startAsStr.charAt(i) - 48; //ASCII '0'				
		for (int i = startAsStr.length(); i < maxWidth; i++) 
			digitArr[i] = INVALID; //Resetting the rest
		
		idx = startAsStr.length()-1;
	}

}
