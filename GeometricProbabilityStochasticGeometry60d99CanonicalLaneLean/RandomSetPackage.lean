import GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean.PointProcessGeometryPackage

namespace HautevilleHouse
namespace GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean

structure RandomClosedSetPackage where
  basicSpace : Type
  hitOrMissTopology : Type
  capacityFunctional : Prop
  choquetTheorem : Prop

structure RandomClosedSetEvidence (R : RandomClosedSetPackage) where
  capacityFunctionalClosed : R.capacityFunctional
  choquetTheoremClosed : R.choquetTheorem

def RandomClosedSetClosed (R : RandomClosedSetPackage) : Prop :=
  R.capacityFunctional ∧ R.choquetTheorem

theorem random_closed_set_closed_from_evidence (R : RandomClosedSetPackage)
    (E : RandomClosedSetEvidence R) : RandomClosedSetClosed R :=
  And.intro E.capacityFunctionalClosed E.choquetTheoremClosed

end GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean
end HautevilleHouse