Feature: To create variable

# if we want to access the variables globally, we put them in background keyword
Background: Defining global variables
* def global_var1 = 'API Automation'
* def global_var2 = 300

Scenario: Creating variable using def keyword
# Syntax 1: Given <def> <variable_name> = <value>
# Syntax 2 : * <def> <variable_name> = <value>

Given def var_int = 100;
And def var_string = 'Karate Framework'
And def var_bool = 'true'
And print 'Integer value is: ->' , var_int
And print 'String value is: ->' , var_string
And print 'Boolean value is: ->' , var_bool
And print 'Global Variable 1: ->', global_var1
And print 'Global Variable 2: ->', global_var2

# we can not access the variables defined in a scenario, outside the scenario
Scenario: Accessing the variables
Given def var_int = 20;
And def var_string = 'Testing API'
And def var_bool = 'false'
And print 'Integer value is: ->' , var_int
And print 'String value is: ->' , var_string
And print 'Boolean value is: ->' , var_bool
And print 'Global Variable 1: ->', global_var1
And print 'Global Variable 2: ->', global_var2