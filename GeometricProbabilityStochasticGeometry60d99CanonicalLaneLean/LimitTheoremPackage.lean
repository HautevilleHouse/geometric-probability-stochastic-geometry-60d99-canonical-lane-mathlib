import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean

structure LimitTheoremPackage where
  lawOfLargeNumbers : Prop
  centralLimitTheorem : Prop
  largeDeviations : Prop
  convergenceRate : Prop

structure LimitTheoremEvidence (L : LimitTheoremPackage) where
  lawOfLargeNumbersClosed : L.lawOfLargeNumbers
  centralLimitTheoremClosed : L.centralLimitTheorem
  largeDeviationsClosed : L.largeDeviations
  convergenceRateClosed : L.convergenceRate

def LimitTheoremClosed (L : LimitTheoremPackage) : Prop :=
  L.lawOfLargeNumbers ∧ L.centralLimitTheorem ∧
  L.largeDeviations ∧ L.convergenceRate

theorem limit_theorem_closed_from_evidence
    (L : LimitTheoremPackage) (E : LimitTheoremEvidence L) :
    LimitTheoremClosed L := by
  exact And.intro E.lawOfLargeNumbersClosed
    (And.intro E.centralLimitTheoremClosed
      (And.intro E.largeDeviationsClosed E.convergenceRateClosed))

end GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean
end HautevilleHouse