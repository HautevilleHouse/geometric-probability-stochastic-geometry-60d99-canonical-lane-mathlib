import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean

def ConstrainedGeometricProbabilityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_geometric_probability_endgame (A : AdmissibleClass) :
    ConstrainedGeometricProbabilityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean
end HautevilleHouse