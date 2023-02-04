capture program drop merge_excel

program merge_excel

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
		SHeet(string)							///
		CELLRAnge(string)						///
		FIRSTrow								///
		dupli									///
		ALLstring								///
		case(string)]
		
		
		
preserve 
import excel "`using'",  sheet("`sheet'") cellrange("`cellrange'") `firstrow' case("`case'") `allstring'  clear

if "`dupli'"=="dupli"{
	duplicates drop `varlist', force
}

tempfile excel_temp
save "`excel_temp'"
restore

if "`how'"=="1:1"{

	merge 1:1 `varlist' using "`excel_temp'" , keepusing(`keepusing') generate("`generate'") `nogenerate'    `nolabel'   `nonotes'   `update'  `replace' `noreport'  `force'  assert("`assert'")   keep("`keep'") `sorted'  
}
else if "`how'"=="m:1"{

	merge m:1 `varlist' using "`excel_temp'" , keepusing(`keepusing') generate("`generate'") `nogenerate'    `nolabel'   `nonotes'   `update'  `replace' `noreport'  `force'  assert("`assert'")   keep("`keep'") `sorted'  
}
else if "`how'"=="1:m"{

	merge 1:m `varlist' using "`excel_temp'" , keepusing(`keepusing') generate("`generate'") `nogenerate'    `nolabel'   `nonotes'   `update'  `replace' `noreport'  `force'  assert("`assert'")   keep("`keep'") `sorted'  
}
else if "`how'"=="m:m"{

	merge m:m `varlist' using "`excel_temp'" , keepusing(`keepusing') generate("`generate'") `nogenerate'    `nolabel'   `nonotes'   `update'  `replace' `noreport'  `force'  assert("`assert'")   keep("`keep'") `sorted'  
}
else{

	merge 1:1 `varlist' using "`excel_temp'" , keepusing(`keepusing') generate("`generate'") `nogenerate'    `nolabel'   `nonotes'   `update'  `replace' `noreport'  `force'  assert("`assert'")   keep("`keep'") `sorted'  


}


end

