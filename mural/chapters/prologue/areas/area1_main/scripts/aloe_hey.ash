# Script that sends arg2 text on chat channel of character with
# arg1 serial ID if raw distance between him and any character from
# area with ID 'area1_main'(expect char with arg1 serial ID) is less
# than 50 and character has flag 'fAloeSearch1', after that script
# halts for 5 secs.
@1 = eugene1#0
@2 = out(resshow -o lang-text -a chatHey1)
true {
	for(@3 = out(areashow -o chars -t area1_main)) {
		@1 != @3 {
		     	rawdis(@1, @3) < 50 {
				out(objecthave -o flag -t @3 -a fAloeSearch_start) == "false" {
					objectset -o chat -a "@2" -t @1;
					wait(5);
			     	};
			};
		};
	};
};
