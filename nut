FoamFile
{
    version 2.0;
    format  ascii;
    class   volScalarField;
    object  nut;
}

dimensions      [0 2 -1 0 0 0 0];

internalField   uniform 0;

boundaryField
{
    farField
    {
        type            calculated;
        value           uniform 0;
    }

    axialFan
    {
        type            nutkWallFunction;
        value           uniform 0;
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
