within GNU_ScientificLibrary.Blocks.specfunc;
block Erf
  extends GNU_ScientificLibrary.Blocks.Interfaces.Block_xy;

equation
  y=Functions.specfunc.erf(x);
  annotation (Icon(graphics={Text(
          extent={{-78,18},{70,-12}},
          lineColor={0,0,0},
          textString="erf(x)")}),
          Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/erf.png\"></div></body></html>"));
end Erf;