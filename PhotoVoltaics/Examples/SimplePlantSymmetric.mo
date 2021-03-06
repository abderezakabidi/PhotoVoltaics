within PhotoVoltaics.Examples;
model SimplePlantSymmetric "Simple symmetric plant"
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Basic.Ground ground annotation (
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PhotoVoltaics.Components.SimplePhotoVoltaics.SimplePlantSymmetric plant(
    moduleData=moduleData,
    T=298.15,
    nsModule=10,
    npModule=2) annotation (Placement(visible=true, transformation(
        origin={0,0},
        extent={{-10,10},{10,-10}},
        rotation=-90)));
  Sources.Blocks.PowerRamp powerRamp(duration = 0.6, height = 8, offset = -4, ref = moduleData.VmpCellRef / moduleData.ImpRef, startTime = 0.2) annotation (
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.VariableResistor variableResistor annotation (
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  parameter PhotoVoltaics.Records.SHARP_NU_S5_E3E moduleData annotation (
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(variableResistor.n, ground.p) annotation (
    Line(points = {{40, -10}, {40, -20}, {0, -20}}, color = {0, 0, 255}));
  connect(plant.p, variableResistor.p) annotation (
    Line(points = {{0, 10}, {0, 20}, {40, 20}, {40, 10}}, color = {0, 0, 255}));
  connect(variableResistor.R, powerRamp.y) annotation (
    Line(points = {{51, 0}, {59, 0}}, color = {0, 0, 127}));
  connect(ground.p, plant.n) annotation (
    Line(points = {{0, -20}, {0, -10}}, color = {0, 0, 255}));
  annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.001),
    __OpenModelica_simulationFlags(jacobian = "coloredNumerical", nls = "newton", s = "dassl", lv = "LOG_STATS"));
end SimplePlantSymmetric;
