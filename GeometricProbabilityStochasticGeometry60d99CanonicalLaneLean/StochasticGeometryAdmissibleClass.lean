import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean

structure StochasticGeometryObject where
  pointProcess : Type
  intensityMeasure : Type

structure AdmittedObject where
  object : StochasticGeometryObject
  convergenceClosed : Prop
  expectationBound : Prop

structure AdmissibleClass where
  object : AdmittedObject
  bridgeWitness : object.convergenceClosed
  gateWitness : object.expectationBound

def bridgeClosed (A : AdmissibleClass) : Prop := A.object.convergenceClosed
def gateClosed (A : AdmissibleClass) : Prop := A.object.expectationBound

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := A.bridgeWitness
theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := A.gateWitness

def ConstrainedStochasticGeometryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_stochastic_geometry_endgame (A : AdmissibleClass) :
    ConstrainedStochasticGeometryClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean
end HautevilleHouse