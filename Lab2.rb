#!/usr/bin/ruby

#CIT 383
#Lab 2
#Johnson, Brennan

HOURS_PER_DAY = 24;
DAYS_PER_WEEK = 7;
MINS_PER_HOUR = 60;
MAXIMUM_MINUTES = HOURS_PER_DAY * DAYS_PER_WEEK * MINS_PER_HOUR;
CREDIT = 25.00;
rate = 0.00;

puts("Please enter the following information.")
print("Plan type (C, R, or S): ");
planType = gets().chomp();

print("Talk minutes: ");
talkMinutes = gets().to_i();

unless(talkMinutes < 0 || talkMinutes > MAXIMUM_MINUTES)

	if(planType == 'c' || planType =='C')
		if(talkMinutes > 300)
			rate = (0.2 * 300) + (0.1 * (talkMinutes - 300));
		else
			rate = 0.2 * talkMinutes;
		end;
		
		puts("\nPlan Type: Commercial");
	
	elsif(planType == 'r' || planType == 'R')
		if(talkMinutes > 120) 
			rate = (0.1 * 120) + (0.05 * (talkMinutes - 120));
		else 
			rate = 0.1 * talkMinutes;
		end;
		
		puts("\nPlan Type: Residential");
	
	elsif(planType == 's' || planType == 'S')
		rate = 0.15 * talkMinutes;
		puts("\nPlan Type: Student");
	else 
		puts("\nInvalid plan type");
		exit 0;
	end;

	puts("\nItem\t\t\tQuantity\tPrice");
	puts("-------\t\t\t-------\t\t-------");
	puts("Talk\t\t\t#{talkMinutes}\t\t$#{'%.2f' % rate}");
	puts("Total\t\t\t\t\t$#{'%.2f' % rate}");
	puts("Credit\t\t\t\t\t$#{'%.2f' % CREDIT}");
	if(rate > 25.00)
		amountDue = rate - CREDIT;
		puts("Amount Due\t\t\t\t$#{'%.2f' % amountDue}");
	else
		remainingCredit = CREDIT - rate;
		puts("Remaining Credit\t\t\t$#{'%.2f' % remainingCredit}")
	end;
else
	puts("Invalid number of minutes");
end;