xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/top/EmpDBRef";
(:: import schema at "nxsd_empResult.xsd" ::)

declare variable $empCollections as element() (:: schema-element(ns1:EmployeesCollection) ::) external;

declare function local:func($empCollections as element() (:: schema-element(ns1:EmployeesCollection) ::)) as element() (:: schema-element(ns1:EmployeesCollection) ::) {
    <ns1:EmployeesCollection>
        {
            for $Employees in $empCollections/ns1:Employees
            return 
            <ns1:Employees>
                <ns1:employeeId>{fn:data($Employees/ns1:employeeId)}</ns1:employeeId>
                <ns1:firstName>{fn:data($Employees/ns1:firstName)}</ns1:firstName>
                <ns1:lastName>{fn:data($Employees/ns1:lastName)}</ns1:lastName>
                <ns1:email>{fn:data($Employees/ns1:email)}</ns1:email>
                <ns1:phoneNumber>{fn:data($Employees/ns1:phoneNumber)}</ns1:phoneNumber>
                <ns1:hireDate>{fn:data($Employees/ns1:hireDate)}</ns1:hireDate>
                <ns1:jobId>{fn:data($Employees/ns1:jobId)}</ns1:jobId>
                <ns1:salary>{fn:data($Employees/ns1:salary)}</ns1:salary>
                {           
                    if(data($Employees/ns1:commissionPct)) then
                        <ns1:commissionPct>{fn:data($Employees/ns1:commissionPct)}</ns1:commissionPct>
                    else
                        <ns1:commissionPct>{xs:string('0.0')}</ns1:commissionPct>
                        
                }
                <ns1:managerId>{fn:data($Employees/ns1:managerId)}</ns1:managerId>
                <ns1:departmentId>{fn:data($Employees/ns1:departmentId)}</ns1:departmentId>
            </ns1:Employees>
        }
    </ns1:EmployeesCollection>
};

local:func($empCollections)
