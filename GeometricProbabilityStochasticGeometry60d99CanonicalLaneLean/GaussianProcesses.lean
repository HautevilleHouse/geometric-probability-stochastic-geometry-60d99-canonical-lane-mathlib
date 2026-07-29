import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean

structure GaussianProcess (Ω : Type u) [MeasureTheory.MeasureSpace Ω] where
  indexSet : Type v
  meanFunction : indexSet → ℝ
  covarianceFunction : indexSet → indexSet → ℝ
  isGaussian : ∀ (finiteSet : Finset indexSet), (λ ω : Ω => (λ i : finiteSet => (someFunction i) ω)) follows MultivariateNormal

def StationarityCondition (gp : GaussianProcess Ω) : Prop :=
  ∀ (h : gp.indexSet) (x : gp.indexSet), gp.covarianceFunction x (x+h) = gp.covarianceFunction 0 h

structure GaussianProcessPackage where
  process : GaussianProcess Ω
  stationary : StationarityCondition process
  continuousSamplePaths : Prop

structure GaussianProcessEvidence (P : GaussianProcessPackage) where
  stationaryClosed : P.stationary
  continuousSamplePathsClosed : P.continuousSamplePaths

def GaussianProcessClosed (P : GaussianProcessPackage) : Prop :=
  P.stationary ∧ P.continuousSamplePaths

theorem gaussian_process_closed_from_evidence (P : GaussianProcessPackage) (E : GaussianProcessEvidence P) : GaussianProcessClosed P := by
  exact And.intro E.stationaryClosed E.continuousSamplePathsClosed

end GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean
end HautevilleHouse