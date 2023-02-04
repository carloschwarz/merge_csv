capture program drop append_excel

program append_excel

capture syntax using/  						///
	[, force								///
		SHeet(string)				///
		CELLRAnge(string)				///
		FIRSTrow					///
		ALLstring					///
		case(string)]
		
		
		
preserve 
import excel "`using'",  sheet("`sheet'") cellrange("`cellrange'") `firstrow' case("`case'") `allstring'  clear
tempfile excel_temp
save "`excel_temp'"
restore

append using "`excel_temp'" , `force' 


end