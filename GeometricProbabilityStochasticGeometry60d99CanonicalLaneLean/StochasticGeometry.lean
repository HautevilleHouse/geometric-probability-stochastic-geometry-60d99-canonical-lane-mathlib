import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean

structure RandomSet (Ω : Type u) [MeasureTheory.MeasureSpace Ω] where
  baseSpace : Type v
  randomClosedSet : Ω → Set baseSpace
  measurable : ∀ (B : Set baseSpace), MeasurableSet (λ ω => {x | x ∈ randomClosedSet ω} ∩ B)

def StationaryRandomSet (R : RandomSet Ω) : Prop :=
  ∀ (h : R.baseSpace), (MeasureTheory.volume) ∘ (λ ω => R.randomClosedSet ω) = (MeasureTheory.volume) ∘ (λ ω => {x + h | x ∈ R.randomClosedSet ω})

def IntensityMeasure (R : RandomSet Ω) : Measure R.baseSpace :=
  λ B => ∫ ω, (if (R.randomClosedSet ω).Nonempty then 1 else 0) ∂ MeasureTheory.volume

structure StochasticGeometryPackage where
  randomSet : RandomSet Ω
  stationary : StationaryRandomSet randomSet
  intensityFinite : IntensityMeasure randomSet ≠ 0
  ergodic : Prop

structure StochasticGeometryEvidence (P : StochasticGeometryPackage) where
  stationaryClosed : P.stationary
  ergodicClosed : P.ergodic

def StochasticGeometryClosed (P : StochasticGeometryPackage) : Prop :=
  P.stationary ∧ P.ergodic

theorem stochastic_geometry_closed_from_evidence (P : StochasticGeometryPackage) (E : StochasticGeometryEvidence P) : StochasticGeometryClosed P := by
  exact And.intro E.stationaryClosed E.ergodicClosed

end GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean
end HautevilleHouse