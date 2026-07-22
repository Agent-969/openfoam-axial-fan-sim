FoamFile
{
    version 2.0;
    format  ascii;
    class   volScalarField;
    object  p;
}

dimensions      [0 2 -2 0 0 0 0];

internalField   uniform 0;

boundaryField
{
    farField
    {
        // p0 = 0 (gauge) on ALL far-field faces: neither face is forced to be
        // "the inlet" or "the outlet" - the fan decides which side draws air
        // in and which it discharges to, exactly like a fan sitting in open air
        type            totalPressure;
        p0              uniform 0;
        value           uniform 0;
    }

    axialFan
    {
        type            zeroGradient;
    }

    AMI_rotor
    {
        type            zeroGradient;
        value           uniform 0;
    }

    AMI_background
    {
        type            zeroGradient;
        value           uniform 0;
    }

    nonConformalCyclic_on_AMI_rotor
    {
        type            nonConformalCyclic;
        value           $internalField;
    }

    nonConformalCyclic_on_AMI_background
    {
        type            nonConformalCyclic;
        value           $internalField;
    }

    nonConformalError_on_AMI_rotor
    {
        type            nonConformalError;
    }

    nonConformalError_on_AMI_background
    {
        type            nonConformalError;
    }
}
