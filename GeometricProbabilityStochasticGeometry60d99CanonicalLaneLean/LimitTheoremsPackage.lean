import GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean

structure LimitTheoremsPackage where
  lawOfLargeNumbers : Prop
  centralLimitTheorem : Prop
  largeDeviations : Prop
  invariancePrinciple : Prop

structure LimitTheoremsEvidence (L : LimitTheoremsPackage) where
  lawOfLargeNumbersClosed : L.lawOfLargeNumbers
  centralLimitTheoremClosed : L.centralLimitTheorem
  largeDeviationsClosed : L.largeDeviations
  invariancePrincipleClosed : L.invariancePrinciple

def LimitTheoremsClosed (L : LimitTheoremsPackage) : Prop :=
  L.lawOfLargeNumbers ∧ L.centralLimitTheorem ∧ L.largeDeviations ∧ L.invariancePrinciple

theorem limit_theorems_closed_from_evidence (L : LimitTheoremsPackage) (E : LimitTheoremsEvidence L) :
    LimitTheoremsClosed L := by
  exact And.intro E.lawOfLargeNumbersClosed
    (And.intro E.centralLimitTheoremClosed
      (And.intro E.largeDeviationsClosed E.invariancePrincipleClosed))

end GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean
end HautevilleHouse