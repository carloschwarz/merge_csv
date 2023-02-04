capture program drop merge_csv

program merge_csv

syntax [varlist(default=none)] using/ [,	///
		how(string)								///
		ASSERT(string)							///			
		DEBUG									///
		GENerate(name)							///
		FORCE									///
		KEEP(string)							///
		KEEPUSing(string)						///
		noLabel									///
		NOGENerate			        			///
		noNOTEs									///
		REPLACE									///
		noREPort								///	
		SORTED									///
		UPDATE       							///
		DELIMiters(string asis)					///
		ROWRange(string)						///
		COLRange(string)						///
		VARNames(string)						///
		case(string)							///
		ASDOUBle								///
		ASFLOat									///
		BINDQuotes(string)						///
		STRIPQuotes(string)						///
		NUMERICCols(string)						///
		STRINGCols(string)						///
		MAXQuotedrows(string)					///
		CHARSET(string)							///
		dupli									///
		ENCoding(string)]
		
		
		
preserve 
import delimited "`using'",  delimiters(`delimiters') rowrange("`rowrange'") colrange("`colrange'") varnames("`varnames'")  case("`case'") `asdouble' `asfloat'  bindquote(`bindquotes') stripquotes("`stripquotes'")  numericcols("`numericcols'") stringcols("`stringcols'") encoding("`encoding'") maxquotedrows("`maxquotedrows'")  clear

if "`dupli'"=="dupli"{
	duplicates drop `varlist', force
}


tempfile csv_temp
save "`csv_temp'"
restore

if "`how'"=="1:1"{

	merge 1:1 `varlist' using "`csv_temp'" , keepusing(`keepusing') generate("`generate'") `nogenerate'    `nolabel'   `nonotes'   `update'  `replace' `noreport'  `force'  assert("`assert'")   keep("`keep'") `sorted'  
}
else if "`how'"=="m:1"{

	merge m:1 `varlist' using "`csv_temp'" , keepusing(`keepusing') generate("`generate'") `nogenerate'    `nolabel'   `nonotes'   `update'  `replace' `noreport'  `force'  assert("`assert'")   keep("`keep'") `sorted'  
}
else if "`how'"=="1:m"{

	merge 1:m `varlist' using "`csv_temp'" , keepusing(`keepusing') generate("`generate'") `nogenerate'    `nolabel'   `nonotes'   `update'  `replace' `noreport'  `force'  assert("`assert'")   keep("`keep'") `sorted'  
}
else{

	merge 1:1 `varlist' using "`csv_temp'" , keepusing(`keepusing') generate("`generate'") `nogenerate'    `nolabel'   `nonotes'   `update'  `replace' `noreport'  `force'  assert("`assert'")   keep("`keep'") `sorted'  


}


end

