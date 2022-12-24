public class C3x5_LRLMR_OMD {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 5
        let stride = interlockWidth + interlockHeight
        var index = 0 //pointer to where we should put next set of words
        var shapeCount = 0
        var outerStart: [UInt8] = []
        var wordId: [UInt8] = []

        for phase in 0..<2 {
            if phase == 1 {
                wordId = Array(repeating: 0, count: stride * shapeCount)
                outerStart = Array(repeating: 0, count: stride * shapeCount)
            }

            for outery1 in 0..<wordCount {

                if W.Len[outery1] >= interlockHeight + 2 {

                    let outery1Limit = Int(W.Len[outery1]) - Int(interlockHeight)
                    for outery1Pos in 1..<outery1Limit {

                        //print("outery1:\(W.Start[outery1])")

                        for left1 in 0..<wordCount {

                            if (W.Len[left1] >= interlockWidth &&
                                W.End[left1][2] == W.Start[outery1][outery1Pos + 0] &&
                                W.Id[left1] != W.Id[outery1]) {
                                //print("left1:\(W.Start[left1])")

                                for middley2 in 0..<wordCount {

                                    if (W.Len[middley2] == interlockHeight &&
                                        W.Start[middley2][0] == W.End[left1][1] &&
                                        W.Id[middley2] != W.Id[left1] &&
                                        W.Id[middley2] != W.Id[outery1]) {
                                        //print("middley2:\(W.Start[middley2])")

                                        for right2 in 0..<wordCount {

                                            if (W.Len[right2] >= interlockWidth &&
                                                W.Start[right2][0] == W.Start[outery1][outery1Pos + 1] &&
                                                W.Start[right2][1] == W.Start[middley2][1] &&
                                                W.Id[right2] != W.Id[middley2] &&
                                                W.Id[right2] != W.Id[left1] &&
                                                W.Id[right2] != W.Id[outery1]) {
                                                //print("right2:\(W.Start[right2])")

                                                for down3 in 0..<wordCount {

                                                    if (W.Len[down3] >= interlockHeight &&
                                                        W.Start[down3][0] == W.End[left1][0] &&
                                                        W.Start[down3][1] == W.Start[right2][2] &&
                                                        W.Id[down3] != W.Id[right2] &&
                                                        W.Id[down3] != W.Id[middley2] &&
                                                        W.Id[down3] != W.Id[left1] &&
                                                        W.Id[down3] != W.Id[outery1]) {
                                                        //print("down3:\(W.Start[down3])")

                                                        for left3 in 0..<wordCount {

                                                            if (W.Len[left3] >= interlockWidth &&
                                                                W.End[left3][2] == W.Start[outery1][outery1Pos + 2] &&
                                                                W.End[left3][1] == W.Start[middley2][2] &&
                                                                W.End[left3][0] == W.Start[down3][2] &&
                                                                W.Id[left3] != W.Id[down3] &&
                                                                W.Id[left3] != W.Id[right2] &&
                                                                W.Id[left3] != W.Id[middley2] &&
                                                                W.Id[left3] != W.Id[left1] &&
                                                                W.Id[left3] != W.Id[outery1]) {
                                                                //print("left3:\(W.Start[left3])")

                                                                for middlex4 in 0..<wordCount {

                                                                    if (W.Len[middlex4] == interlockWidth &&
                                                                        W.Start[middlex4][0] == W.Start[outery1][outery1Pos + 3] &&
                                                                        W.Start[middlex4][1] == W.Start[middley2][3] &&
                                                                        W.Start[middlex4][2] == W.Start[down3][3] &&
                                                                        W.Id[middlex4] != W.Id[left3] &&
                                                                        W.Id[middlex4] != W.Id[down3] &&
                                                                        W.Id[middlex4] != W.Id[right2] &&
                                                                        W.Id[middlex4] != W.Id[middley2] &&
                                                                        W.Id[middlex4] != W.Id[left1] &&
                                                                        W.Id[middlex4] != W.Id[outery1]) {
                                                                        //print("middlex4:\(W.Start[middlex4])")

                                                                        for right5 in 0..<wordCount {

                                                                            if (W.Len[right5] >= interlockWidth &&
                                                                                W.Start[right5][0] == W.Start[outery1][outery1Pos + 4] &&
                                                                                W.Start[right5][1] == W.Start[middley2][4] &&
                                                                                W.Start[right5][2] == W.Start[down3][4] &&
                                                                                W.Id[right5] != W.Id[middlex4] &&
                                                                                W.Id[right5] != W.Id[left3] &&
                                                                                W.Id[right5] != W.Id[down3] &&
                                                                                W.Id[right5] != W.Id[right2] &&
                                                                                W.Id[right5] != W.Id[middley2] &&
                                                                                W.Id[right5] != W.Id[left1] &&
                                                                                W.Id[right5] != W.Id[outery1]) {
                                                                                //print("right5:\(W.Start[right5])")

                                                                                if phase == 0 {
                                                                                    shapeCount += 1
                                                                                }
                                                                                else {
                                                                                    outerStart[index + 5] = UInt8(outery1Pos)

                                                                                    ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [left1, right2, left3, middlex4, right5, outery1, middley2, down3])
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        return ClusterModel(
            wordId: wordId,
            outerStart: outerStart,
            patternHorizontal: [.leading, .trailing, .leading, .middle, .trailing],
            patternVertical: [.outer, .middle, .trailing],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}