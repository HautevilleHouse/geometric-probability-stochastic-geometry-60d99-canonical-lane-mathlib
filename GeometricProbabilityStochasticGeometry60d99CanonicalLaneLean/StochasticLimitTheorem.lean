import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean

structure StochasticLimitTheoremPackage where
  randomField : Type u
  probabilitySpace : Type v
  indexSet : Type w
  limitLaw : Prop
  convergenceMode : Prop
  uniformIntegrability : Prop
  centralLimitTypeRate : Prop

structure StochasticLimitTheoremEvidence (P : StochasticLimitTheoremPackage) where
  limitLawClosed : P.limitLaw
  convergenceModeClosed : P.convergenceMode
  uniformIntegrabilityClosed : P.uniformIntegrability
  centralLimitTypeRateClosed : P.centralLimitTypeRate

def StochasticLimitTheoremClosed (P : StochasticLimitTheoremPackage) : Prop :=
  P.limitLaw ∧ P.convergenceMode ∧ P.uniformIntegrability ∧ P.centralLimitTypeRate

theorem stochastic_limit_theorem_closed_from_evidence (P : StochasticLimitTheoremPackage) (E : StochasticLimitTheoremEvidence P) :
    StochasticLimitTheoremClosed P := by
  exact And.intro E.limitLawClosed (And.intro E.convergenceModeClosed (And.intro E.uniformIntegrabilityClosed E.centralLimitTypeRateClosed))

end GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean
end HautevilleHouse