within GNU_ScientificLibrary.Examples.integration.DoubleFDIntegrals;

model DoubleFDIntegrand "Create double-FD integrand"
  // contact: tommy.burch@physik.uni-r.de
  extends Modelica.Icons.Example;
  //
  parameter String C_integrand = 
    "gsl_sf_fermi_dirac_mhalf(x)*gsl_sf_fermi_dirac_mhalf(x)*pow((par[0]-x),(par[1]-1))" 
      "Integrand in C-code, =f(x)";
  //
  parameter Integer rcode[2] = 
    GNU_ScientificLibrary.Functions.integration.integrand_setup(C_integrand);
  annotation(
    Icon(graphics = {Text(extent = {{-78, 18}, {70, -12}}, lineColor = {0, 0, 0}, textString = C_integrand)}),
    preferredView = "text",
    Documentation(info = "<html><head></head><body>Integrand-setup \"model\" for double Fermi-Dirac integrals. e.g., ...&nbsp;<div><br></div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>integrand: f<sub>m,jk</sub>(x,y) = (y-x)<sup>m-1</sup> F<sub>j</sub>(x) F<sub>k</sub>(x)&nbsp;<br><div><br></div><div>USAGE: To create a different integrand function, simply duplicate this model and change the String 'C_integrand' for the desired mathematical function in standard C-syntax. This model then needs to be \"simulated\" (it actually only copies/creates files, compiles and archives them) before the larger model, which may then include multiple uses of the relevant 'integrand' (e.g., in qag or other GSL routines).</div><div><br></div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>in C-syntax: \"gsl_sf_fermi_dirac_mhalf(x)*gsl_sf_fermi_dirac_mhalf(x)*pow((par[0]-x),(par[1]-1))\"&nbsp;</div>
<div><div><br></div><div>Note the possibility to place parameters (always with 'par' and always starting with index 0). The values of these can then be set during the larger model runtime (see the integration blocks).</div><div><br></div><div>Wherever possible, Modelica.Utilities routines are used to handle file / system commands. The current exception is the use of 'gcc' to compile the libgsl_integration_MI.so / libgsl_integration_MI.dll library. This is standard on any Linux system and is available for any Windows system via 'mingw'.</div></div><div><br></div><div>Alternatively, one could edit integrand.c directly and then compile \"by hand\" in a command window:&nbsp;</div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>gcc -fPIC -c integrand.c integration_mi.c</div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>gcc -shared integration.o integration_mi.o -o libgsl_integration_MI.so &nbsp;[.dll for windows]</div></div></body></html>"));
end DoubleFDIntegrand;