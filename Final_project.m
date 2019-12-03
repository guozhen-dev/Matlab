clear all; clc;
index = ['123'];
filename_prefix = 'ecg';
for file_number=(1:3)
    clear ecg;
    clear time;
    file_name = [filename_prefix,index(file_number)];
    load(file_name) ;
    total_time = time(length(time));
    heartbeats_counter = 0;
    PR_interval_tot = 0;
    %appromix the PR-interval
    for i=(1:length(time))
        if(marker(i)==1)
            for j=(i:length(time))
                if(marker(j)==3)
                    PR_interval_tot = PR_interval_tot + time(j) - time(i);
                    break;
                end
            end
        end
    end
    for i=(1:length(time))
        if (marker(i) == 3)
            heartbeats_counter = heartbeats_counter + 1;
        end
    end
    PR_int_avg = PR_interval_tot/heartbeats_counter;
    heartrate = heartbeats_counter * 60 / total_time;
    hold on;
%     below is for the second deriv/ test method 
%     ecg_prime(length(time)-1) = [0];
%     time_prime(length(time)-1) = [0];
%     for i=(1:length(time)-1)
%         ecg_prime(i) = (ecg(i+1) - ecg(i))/(time(i+1) - time(i));
%         time_prime(i) = (time(i+1) + time(i))/2;
%     end
%     plot (time_prime(1:1000),ecg_prime(1:1000),'g');
%     ecg_prime_prime(length(time_prime)-1) = [0];
%     time_prime_prime(length(time_prime)-1) = [0];
%     for i=(1:length(time_prime)-1)
%         ecg_prime_prime(i) = (ecg_prime(i+1) - ecg_prime(i))/(time_prime(i+1) - time_prime(i));
%         time_prime_prime(i) = (time_prime(i+1) + time_prime(i))/2;
%     end
%     plot (time_prime_prime(1:1000),ecg_prime_prime(1:1000),'b');    
%     above is for the second deriv/ test method 
    for i=(1:1000)
        if marker(i)==1
            plot(time(i),ecg(i),'b+'); % plot the marker on the figure
            text(time(i),ecg(i),' P');
        elseif marker(i)==2
            plot(time(i),ecg(i),'b+');
            text(time(i),ecg(i),' Q');
        elseif marker(i)==3
            plot(time(i),ecg(i),'b+');
            text(time(i),ecg(i),' R');
        elseif marker(i)==4
            plot(time(i),ecg(i),'b+');
            text(time(i),ecg(i),' S');
        elseif marker(i)==5
            plot(time(i),ecg(i),'b+');
            text(time(i),ecg(i),' T');
        end
    end
    %below is for label the figure
    leg = plot(time(1:1000),ecg(1:1000),'r');
    xlabel('time(s)');
    ylabel('signal voltage(mV)')
    tit = ['The ECG for patient No.',index(file_number)];
    title(tit);
    legend([leg],{'Signal Voltage'});
    %output the analysis result 
    fprintf("total heartbeats: %d\ntotal time: %.1f seconds\nheartrate: %.3f/min \nPR interval is: %.3f seconds \n",heartbeats_counter,total_time ,heartrate,PR_int_avg);
    if(heartrate > 100)
        fprintf("Warning: The patient has Sinus Tachycardia\n");
    elseif (heartrate < 60)
        fprintf("Warning: The patient has Sinus Bradycardia\n");
    else
        fprintf("INFO: The patient's heartrate looks good.\n");
    end
    if (PR_int_avg < 0.12)
        fprintf("Warning: Short PR segment! Consider Wolff-Parkinson-White syndrome or Lown-Ganong-Levine syndrome (other causes - Duchenne muscular dystrophy, type II glycogen storage disease (Pompe's), HOCM)\n");
    elseif (PR_int_avg > 0.2)
        fprintf("Warning: Long PR interval! Consider first degree heart block and 'trifasicular' block\n");
    else
        fprintf("INFO: The patient's PR interval looks good\n");
    end
    fprintf("The analysis on Patient %s is completed. Press any key to continue:\n\n",index(file_number));
    pause;
    close;

end
