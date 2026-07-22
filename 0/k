FoamFile
{
    version 2.0;
    format  ascii;
    class   volScalarField;
    object  k;
}

dimensions      [0 2 -2 0 0 0 0];

// low ambient turbulence level for still air; k = 1.5*(U*I)^2 with a small
// nominal reference velocity and ~1% intensity
internalField   uniform 1e-4;

boundaryField
{
    farField
    {
        type            inletOutlet;
        inletValue      uniform 1e-4;
        value           uniform 1e-4;
    }

    axialFan
    {
        type            kqRWallFunction;
        value           uniform 1e-4;
    }

    AMI_rotor
    {
        type            zeroGradient;
        value           uniform 1e-4;
    }

    AMI_background
    {
        type            zeroGradient;
        value           uniform 1e-4;
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
